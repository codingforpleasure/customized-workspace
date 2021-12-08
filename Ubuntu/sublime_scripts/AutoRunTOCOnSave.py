import sublime, sublime_plugin
import subprocess
import os

class AutoRunTOCOnSave(sublime_plugin.EventListener):
    """ A class to listen for events triggered by ST. """

    def on_post_save_async(self, view):
        """
        This is called after a view has been saved. It runs in a separate thread
        and does not block the application.
        """

        file_path = view.file_name()
        if not file_path:
            return
        
        if file_path.split(".")[-1].lower() == "md":
            content_title = os.path.basename(file_path)[:-3]
            filename = os.path.basename(file_path)
            print("Markdown TOC was invoked: handling with *.md file")
            subprocess.check_call("gh-md-toc --insert %s" % file_path, shell=True)
            
            dir_name = os.path.dirname(file_path)

            # Commiting the changes to my remote repo
            if os.path.basename(dir_name) == "useful-resources":
                repo_path_on_drive = "/home/gil_diy/customized-workspace/Ubuntu/useful-resources"
                print("Git repository is getting updated")
                
                git_commit_cmd = "git commit -m"
                message = "Update to file " +  content_title  + "\" "

                git_add_cmd = "git add %s" % file_path
                git_push = "git push"


                # use the cwd to set the working directory, since
                # cd is a shell builtin (not a separate executable),
                # it can change the directory only in the same process
                subprocess.check_call(git_add_cmd.split(), shell=False, cwd=repo_path_on_drive)
                subprocess.check_call(git_commit_cmd.split() + [message] + [file_path], shell=False, cwd=repo_path_on_drive)
                subprocess.check_call(git_push.split(), shell=False, cwd=repo_path_on_drive)
            else:
                print("The file %s is not inside the useful-resources, therefore can't commit the file to the repo." % filename)

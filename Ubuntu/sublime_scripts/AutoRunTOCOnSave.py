import sublime, sublime_plugin
import subprocess

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
            print("Markdown TOC was invoked: handling with *.md file")
            subprocess.check_call("gh-md-toc --insert %s" % file_path, shell=True)
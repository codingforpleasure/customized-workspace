import sys
import webbrowser
import os

if __name__ == '__main__':
    path = "/home/gil_diy/my_documentation_helper/"

    all_filenames = os.listdir(path)

    if len(sys.argv) > 1:
        topic_name = str(sys.argv[1]).lower()
        filename = topic_name + ".html"
        print('filename: '+filename)
        if filename in all_filenames:
            print(path + filename)
            webbrowser.open(path + filename, new=2)
        else:
            print("ATTENTION: Command was not found in the collection, make sure you have exported to html.")
    else:
        print("ERROR: You should supply command.")

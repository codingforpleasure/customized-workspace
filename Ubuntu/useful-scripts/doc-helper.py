import sys
import webbrowser

if __name__ == '__main__':
    path = "/home/gil_diy/my_documentation_helper/"

    commands = {'aspell': 'not-found.html',
                'awk': 'awk.html',
                'bash': 'bash.html',
                'cron':'cron.html',
                'sed': 'sed.html',
                'tr': 'tr.html',
                'cut': 'not-found.html',
                'find': 'not-found.html',
                'lsof': 'not-found.html',
                'xargs': 'xargs.html',
                'exec' : 'not-found.html',
                'seq': 'not-found.html',
                'sort': 'not-found.html',
                'uniq': 'not-found.html',
                'paste': 'not-found.html',
                'join': 'not-found.html',
                'basename': 'not-found.html',
                'cmp': 'not-found.html',
                'curl': 'not-found.html',
                'date': 'not-found.html',
                'dirname': 'not-found.html',
                'du': 'not-found.html',
                'exit': 'not-found.html',
                'top': 'not-found.html',
                'nohup': 'not-found.html',
                'split': 'not-found.html',
                'tee': 'not-found.html',
                'yes': 'not-found.html',
                'dd' : 'not-found.html',
                'pandoc': 'not-found.html',
                'opencv': 'opencv.html',
                'feh': 'feh.html',
                'printf': 'printf.html',
                'echo': 'echo.html',
                'numpy':'numpy.html'
                }

    if len(sys.argv) > 1:
        topic_name = str(sys.argv[1]).lower()
        if topic_name in commands:
            webbrowser.open(path + commands[topic_name], new=2)
        else:
            print("ATTENTION: Command was not found in the collection, should add it.")
    else:
        print("ERROR: You should supply command.")

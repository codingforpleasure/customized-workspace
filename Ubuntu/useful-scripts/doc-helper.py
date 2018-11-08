import sys
import webbrowser

if __name__ == '__main__':
    path = "/home/gil_diy/my_documentation_helper/"

    commands = {'apt': 'apt.html',
                'aspell': 'not-found.html',
                'awk': 'awk.html',
                'basename': 'not-found.html',
                'bash': 'bash.html',
                'cmp': 'not-found.html',
                'cron':'cron.html',
                'curl': 'not-found.html',
                'cut': 'not-found.html',
                'date': 'not-found.html',
                'dd' : 'not-found.html',
                'dirname': 'not-found.html',
                'du': 'not-found.html',
                'echo': 'echo.html',
                'elasticsearch' : 'es.html',
                'es' : 'es.html',
                'elastic-search' : 'es.html',
                'exec' : 'not-found.html',
                'exit': 'not-found.html',
                'feh': 'feh.html',
                'find': 'find.html',
                'join': 'join.html',
                'json' : 'json.html',
                'lsof': 'not-found.html',
                'matplotlib': 'matplotlib.html',
                'nlp' : 'nlp.html',
                'nohup': 'not-found.html',
                'numpy':'numpy.html',
                'opencv': 'opencv.html',
                'pandas': 'pandas.html',
                'pandoc': 'not-found.html',
                'parallel': 'parallel',
                'paste': 'not-found.html',
                'pipenv' : 'pipenv.html',
                'printf': 'printf.html',
                'python-package-manager' : 'python-package-manager.html',
                'python-regex' : 'python-regex.html',
                'rsync' : 'rsync.html',
                'sed': 'sed.html',
                'seq': 'not-found.html',
                'service' : 'service.html',
                'sort' : 'not-found.html',
                'sort': 'sort.html',
                'split': 'not-found.html',
                'tee': 'not-found.html',
                'top': 'not-found.html',
                'tmux': 'tmux.html',
                'tr': 'tr.html',
                'uniq': 'not-found.html',
                'wget': 'wget.html',
                'xargs': 'xargs.html',
                'yes': 'not-found.html'
                }


    if len(sys.argv) > 1:
        topic_name = str(sys.argv[1]).lower()
        if topic_name in commands:
            webbrowser.open(path + commands[topic_name], new=2)
        else:
            print("ATTENTION: Command was not found in the collection, should add it.")
    else:
        print("ERROR: You should supply command.")

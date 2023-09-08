import ffmpeg
import json

if __name__ == '__main__':
    with open('timestamps.json', 'r') as fd:
        data = json.load(fd)

    timestamps = data['timestamp']
    titles = data['Titles']

    for idx, (start, end, title) in enumerate(zip(timestamps[:-1], timestamps[1:], titles)):
        time = end - start
        print(f'{idx}) {title}:  start :{start} - end: {end}')
        ffmpeg.input("Woodcock.mp4", ss=start, t=time).output(f'{idx}_{title}.mp4').run()

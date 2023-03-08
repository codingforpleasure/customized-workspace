# This script is for breaking a transcript according to a given constraint regarding
# the line length after downloading from here:
# To get the transcription of a youtube video, use this website: https://downsub.com/

MAX_LINE_LENGTH = 100


def break_lines(long_line):
    words = long_line.split()
    lines = []
    current_line = ''
    for word in words:
        if len(current_line) + len(word) + 1 <= MAX_LINE_LENGTH:
            current_line += word + ' '
        else:
            lines.append(current_line.strip())
            current_line = word + ' '
    lines.append(current_line.strip())
    return '\n'.join(lines)


if __name__ == '__main__':
    input_path = '/home/gil_diy/PycharmProjects/nn_andrej_karpathy_tutorials/input.txt'
    output_path = '/home/gil_diy/PycharmProjects/nn_andrej_karpathy_tutorials/output.txt'
    with open(input_path, 'r') as fd:
        data = fd.readlines()
        long_line = ' '.join(data)
        long_line = long_line.replace('\n', ' ')
        res = break_lines(long_line)

    with open(output_path, 'w') as fd:
        fd.writelines(res)

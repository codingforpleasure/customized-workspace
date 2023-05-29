import imageio

if __name__ == '__main__':

    # List of GIF files to stitch together
    gif_files = ["images/anim_0.gif", "images/anim_1.gif", "images/anim_2.gif", "images/anim_3.gif"]

    # Create a list to hold the frames of the stitched GIF
    frames = []

    # Iterate over the GIF files
    for gif_file in gif_files:
        # Read the frames from the current GIF file
        gif_frames = imageio.mimread(gif_file)
        # Extend the frames list with the frames from the current GIF file
        frames.extend(gif_frames)

    # Save the stitched GIF file
    output_file = "stitched.gif"
    imageio.mimsave(output_file, frames, format='GIF', duration=0.1)

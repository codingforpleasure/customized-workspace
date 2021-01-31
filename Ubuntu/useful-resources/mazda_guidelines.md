# Steps:

1. Scrape all colors

2. Remove irrelavant images for each color:
```bash
MAZDA_ORIGINAL_IMGS="/home/gil_diy/PycharmProjects/improve_scraper_cargurus/images/Mazda/MAZDA6/BLACK"
python detect.py --source $MAZDA_ORIGINAL_IMGS
                 --classes 2
                 --move-images
                 --save-txt
                 --max-bbox
```

3. Clean manually (A lot of time)

4. rename all files in each sub_directory so the sequence number will be consecutive
```
python improve_scraper_cargurus/rrename_all_files_with_correct_counter_in_nested_directories.py
```

5. Generate txt files:

```bash
python detect.py --source ./mazda_hierarchy_big_data_set/
                 --classes 2
                 --move-images
                 --save-txt
                 --max-bbox
                 --remove-mistaken-bbox
                 --nested-src-directory
                 --txt-for-future-training
```

6. Check the library `./was_mistaken_with_other_bbox`

7. Take a look in all bounding boxes: `./single_box` (text files appears there too) make sure it 
   identified all relevant cars.

8. create mapping file *.yaml 

9. Iterate ove all annotation files (txt files), and modify their label into their proper label as declared in your yaml file.  
   run the script:
   ```
   python ./modify_annotation_txt_files_according_to_classes.py 
   ```
10.  Split the dataset into training, validation and test set using the script (modify it ):
```
python /home/gil_diy/PycharmProjects/yolov5_play/split_large_dataset.py
```

11. Upload the data to google cloud
 
12. Train the model

13. run prediction:
14. Check for accuracy stats:
```
python /home/gil_diy/PycharmProjects/yolov5_play/get_stats_for_prediction.py
```

 
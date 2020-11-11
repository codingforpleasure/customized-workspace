<!--ts-->
   * [Steps:](#steps)
      * [Phase #1: Scraping](#phase-1-scraping)
         * [Step 1: Scrape all colors](#step-1-scrape-all-colors)
      * [Phase #2: Cleaning Data](#phase-2-cleaning-data)
         * [Step 2:  Remove identical and Agency advertisement images](#step-2--remove-identical-and-agency-advertisement-images)
         * [Step 3: Make all images in a flat hierarchy level](#step-3-make-all-images-in-a-flat-hierarchy-level)
         * [Step 3:  Remove irrelavant images for each color:](#step-3--remove-irrelavant-images-for-each-color)
         * [Step 4: Clean manually (A lot of time)](#step-4-clean-manually-a-lot-of-time)
         * [Step 5: rename all files in each sub_directory so the sequence number will be consecutive](#step-5-rename-all-files-in-each-sub_directory-so-the-sequence-number-will-be-consecutive)
         * [Step 6: Convert each class into flat hierarchy:](#step-6-convert-each-class-into-flat-hierarchy)
      * [Phase #3: Annotations](#phase-3-annotations)
         * [Step 7: Generate annotation files (txt files)](#step-7-generate-annotation-files-txt-files)
         * [Step 8: Checking bbox results:](#step-8-checking-bbox-results)
         * [Step 15: move all corresponding text files into directory was_mistaken_with_other_bbox using a script. ???](#step-15-move-all-corresponding-text-files-into-directory-was_mistaken_with_other_bbox-using-a-script-)
         * [Step 9: run the script:](#step-9-run-the-script)
         * [Step 11: Give annotations to to all png images which appeared in was_mistaken_with_other_bbox](#step-11-give-annotations-to-to-all-png-images-which-appeared-in-was_mistaken_with_other_bbox)
         * [Step 12: Add your annotations in labelme (Manualy)](#step-12-add-your-annotations-in-labelme-manualy)
         * [Step 13: Convert from json annotation to txt file annotation](#step-13-convert-from-json-annotation-to-txt-file-annotation)
         * [Step 15: run a script to check all annotations](#step-15-run-a-script-to-check-all-annotations)
         * [Step 16: Make sure the annotation was converted correctly to txt files](#step-16-make-sure-the-annotation-was-converted-correctly-to-txt-files)
         * [Step 13: iterate over all png files located in ./was_detected directory and copy all corresponding txt files from ./single_bbox directory.](#step-13-iterate-over-all-png-files-located-in-was_detected-directory-and-copy-all-corresponding-txt-files-from-single_bbox-directory)
         * [Step 14: create mapping config file .yaml](#step-14-create-mapping-config-file-yaml)
         * [Step 15: Modify each annotation file](#step-15-modify-each-annotation-file)
         * [Step 16:  Split the dataset into training, validation and test set using a script:](#step-16--split-the-dataset-into-training-validation-and-test-set-using-a-script)
         * [Step 17: Upload the data to google cloud](#step-17-upload-the-data-to-google-cloud)
         * [Step 18: Train the model](#step-18-train-the-model)
         * [Step 19: run prediction:](#step-19-run-prediction)
         * [Step 20: Check for accuracy stats:](#step-20-check-for-accuracy-stats)

<!-- Added by: gil_diy, at: Wed Nov 11 18:13:55 IST 2020 -->

<!--te-->

# Steps:

## Phase #1: Scraping

### Step 1: Scrape all colors

run the script:
```bash
python improve_scraper_cargurus/
```

## Phase #2: Cleaning Data

### Step 2:  Remove identical and Agency advertisement images

```bash
./remove_duplicate_images_and_advertisements.py.py
```

### Step 3: Make all images in a flat hierarchy level

Since there are some images which belong to few classes we should remove it.

```bash
python ./improve_scraper_cargurus/convert_heirarchy_directory_to_flat_directory.py
```


### Step 3:  Remove irrelavant images for each color:

```bash
./detect_and_seperate_interiors.sh
```

### Step 4: Clean manually (A lot of time)

### Step 5: rename all files in each sub_directory so the sequence number will be consecutive

```bash
python improve_scraper_cargurus/rename_all_files_with_correct_counter_in_nested_directories.py
```

### Step 6: Convert each class into flat hierarchy:

```bash
python improve_scraper_cargurus/convert_heirarchy_directory_to_flat_directory.py
```

## Phase #3: Annotations

### Step 7: Generate annotation files (txt files)

```bash
python 2_detect_and_put_bounding_boxes.sh
```

### Step 8: Checking bbox results:

1. Check the library `./was_mistaken_with_other_bbox`

2. Take a look in all bounding boxes: `./single_box` (text files appears there too) make sure it 
   identified all relevant cars.

### Step 15: move all corresponding text files into directory `was_mistaken_with_other_bbox` using a script. ???

### Step 9: run the script:

```bash
python improve_scraper_cargurus/remove_annotations_with_mistaken_bbox.py
```

### Step 11: Give annotations to to all png images which appeared in `was_mistaken_with_other_bbox`

### Step 12: Add your annotations in labelme (Manualy)

### Step 13: Convert from json annotation to txt file annotation

```bash
python improve_scraper_cargurus/convert_labelme_json_to_coco_txt_format.py
```

### Step 15: run a script to check all annotations

```bash
python /improve_scraper_cargurus/check_all_annotations_files_format.py
```


### Step 16: Make sure the annotation was converted correctly to txt files

```bash
python yolov5_play/draw_annotation_on_image.py
```



### Step 13: iterate over all png files located in `./was_detected` directory and copy all corresponding txt files from `./single_bbox` directory. 

### Step 14: create mapping config file .yaml

### Step 15: Modify each annotation file

Iterate over all annotation files (txt files), and modify their label into their proper label as declared in your yaml file you created in `Step 12`

run the script:
   
```bash
python ./improve_scraper_cargurus/modify_annotation_txt_files_according_to_classes_new.py
```

    
### Step 16:  Split the dataset into training, validation and test set using a script:

Modify it:

```
python /home/gil_diy/PycharmProjects/yolov5_play/split_large_dataset.py
```

### Step 17: Upload the data to google cloud
	
	important tips:
	
	1. Make sure you have modified the yaml file so the path will work  
	2. Upload zip file (collection of images)
	3. upload the yaml file
	4. turn on GPU and then extract the files otherwise if your restart the runtime the directory will vanish

 
### Step 18: Train the model

### Step 19: run prediction:

### Step 20: Check for accuracy stats:

```bash
python /home/gil_diy/PycharmProjects/yolov5_play/get_stats_for_prediction.py
```
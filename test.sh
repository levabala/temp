for FILE_NAME in $(ls testfolder)
do
  NEW_NAME="${FILE_NAME}_qwe"
  echo $NEW_NAME
  cp testfolder/$FILE_NAME testfolder/$NEW_NAME
done

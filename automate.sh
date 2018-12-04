git pull --all
git checkout master
git merge origin/AuctionDao -m "Merge remote-tracking branch 'origin/AuctionDao'"
git merge origin/BidDao -m "Merge remote-tracking branch 'origin/BidDao'" 
git merge origin/CustomerDao -m "Merge remote-tracking branch 'origin/CustomerDao'"
git merge origin/EmployeeDao -m "Merge remote-tracking branch 'origin/EmployeeDao'"
git merge origin/ItemDao -m "Merge remote-tracking branch 'origin/ItemDao'"
git merge origin/LoginDao -m "Merge remote-tracking branch 'origin/LoginDao'"
git merge origin/PostDao -m "Merge remote-tracking branch 'origin/PostDao'"
git push -u origin master
zip -r archive.zip dao model resources
git checkout eclipse-stuff
unzip -o archive.zip
cp dao/* CSE305/src/main/java/dao/
cp model/* CSE305/src/main/java/model/
cp resources/* CSE305/src/main/java/resources/
rm -r dao/
rm -r model/
rm -r resources/
rm archive.zip
git add -u
git reset -- automate.sh
git commit -m "Merge most recent remote origin/Master"
git push -u origin eclipse-stuff
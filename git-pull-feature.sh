echo "dailyfeed-code"
cd dailyfeed-code
git pull origin $1
cd ..
echo ""


echo "dailyfeed-feign"
cd dailyfeed-feign
git pull origin $1
cd ..
echo ""


echo "dailyfeed-pagination-support"
cd dailyfeed-pagination-support
git pull origin $1
cd ..
echo ""


echo "dailyfeed-redis-support"
cd dailyfeed-redis-support
git pull origin $1
cd ..
echo ""


echo "dailyfeed-kafka-support"
cd dailyfeed-kafka-support
git pull origin $1
cd ..
echo ""


echo "dailyfeed-timeline"
cd dailyfeed-timeline
git pull origin $1
cd ..
echo ""
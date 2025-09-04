
# 새로운 환경에서 클론
```bash
# Submodule과 함께 클론
git clone --recurse-submodules <dailyfeed-timeline-svc-repository-url>

# 또는 클론 후 submodule 초기화
git clone <dailyfeed-timeline-svc-repository-url>
cd dailyfeed-timeline-svc
git submodule init
git submodule update
```
<br/>


# 개별 서브모듈 작업 후 커밋,푸시
모듈 디레터리에서
```bash
cd dailyfeed-timeline
git checkout [브랜치명]
## 작업 후
git add .
git commit -m "메시지"
git push -u origin [브랜치명]
```
<br/>

루트프로젝트에 업데이트
```bash
cd ..
git add dailyfeed-timeline
git commit -m "submodule update: dailyfeed-timeline"
git push -u origin main
```
<br/>

# 서브모듈 업데이트
```bash
# 모든 submodule을 최신 상태로 업데이트
git submodule update --remote

# 특정 submodule만 업데이트
git submodule update --remote booksfeed-code
```

# jib 빌드
intellij 에서 jib, jibDockerBuild 는 동작하지 않으며 터미널에서 다음과 같이 실행해주셔야 합니다.
```bash
./gradlew :dailyfeed-timeline:jibDockerBuild
docker push alpha300uk/dailyfeed-timeline-svc:0.0.1
```

또는 다음과 같이 push 를 함께 하는 것 역시 가능합니다.
```bash
./gradlew :dailyfeed-timeline:jib
```
<br/>

# docker 로그인
docker hub 를 사용한다면 docker login 을 해야합니다. 이번 프로젝트의 경우 비용을 극도로 줄여야하기에 ECR 보다는 docker hub 를 사용하게 되었습니다.
```bash
docker login
```
<br/>


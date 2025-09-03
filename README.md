
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

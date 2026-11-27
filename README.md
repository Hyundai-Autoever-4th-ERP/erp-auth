# ERP Auth

## 로컬 실행

JDK 25와 Docker가 필요합니다. 클론한 저장소에서 커밋 훅을 한 번 설정하세요.

```sh
git config --local core.hooksPath .githooks
```

로컬 DB를 켜고 앱을 실행하세요.

```sh
docker compose up -d
./gradlew bootRun
```

IntelliJ에서는 프로젝트 SDK와 Gradle JVM을 25로 설정하고 `AuthApplication`을 실행합니다. Windows 터미널에서는 `.\gradlew.bat bootRun`을 사용합니다.

- 상태 확인 [Actuator Health](http://localhost:8081/actuator/health)
- API 문서 [Swagger UI](http://localhost:8081/swagger-ui/index.html)
- 테스트는 로컬 DB를 실행한 상태에서 `./gradlew test`로 확인합니다.

## 로컬 DB 접속

| 접속 항목 | 값 |
| --- | --- |
| 주소 | `localhost:15431` |
| 데이터베이스 | `auth_db` |
| 사용자 | `auth_app` |
| 로컬 비밀번호 | `auth_local` |

`docker compose down`으로 종료해도 데이터는 볼륨에 남습니다.

처음 DB를 만들면 `users` 테이블에 사용자 8명이 들어갑니다. 기존 로컬 DB는 앱을 실행하면 누락된 마스터가 추가됩니다.

## 사용자 이메일

로그인 식별자는 사번이다. 관리자가 신규 사용자를 등록할 때 알림용 사내 이메일을 필수로 받는다. 등록 API는 누락·공백·잘못된 이메일 형식과 40자 초과 입력을 검증한다. 해당 API는 구현 예정이다.

원본 사용자 8명에게는 이메일이 없어 `users.email`은 NULL을 허용한다. 새 로컬 DB는 초기화 시 컬럼을 만들고, 기존 DB는 앱 재시작 시 같은 컬럼을 추가한다.

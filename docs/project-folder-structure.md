Cấu trúc thư mục cho dự án Spring Boot (Java 1.8) + JSP
```
project-root/                                 # root của dự án
├─ pom.xml
├─ .env.sample
├─ README.md
├─ docs/
│  ├─ basic-design.md
│  └─ database-structure.md
├─ sql/
│  └─ bookshopai.sql                      # init SQL (author,genre,book,description)
├─ src/
│  ├─ main/
│  │  ├─ java/
│  │  │  └─ vn/
│  │  │     └─ com/
│  │  │        └─ bookshopAI/
│  │  │           ├─ controller/                # Controllers (exact file names below)
│  │  │           │  ├─ BookListController.java         # GET /listbook
│  │  │           │  ├─ BookDetailsController.java      # GET /bookdetails
│  │  │           │  ├─ DescriptionConfirmController.java  # POST /generateConfirm (save)
│  │  │           │  ├─ DescriptionChangeController.java   # POST /bookdetails/changeDescription (set active)
│  │  │           │  └─ AiGenerateController.java         # GET /generateInput, POST /generateAI
│  │  │           │
│  │  │           ├─ service/
│  │  │           │  ├─ BookService.java
│  │  │           │  ├─ DescriptionService.java
│  │  │           │  └─ AiService.java                    # wrapper for AI API + timeout/quota handling
│  │  │           │
│  │  │           ├─ repository/
│  │  │           │  ├─ BookRepository.java
│  │  │           │  ├─ DescriptionRepository.java
│  │  │           │  ├─ AuthorRepository.java
│  │  │           │  └─ GenreRepository.java
│  │  │           │
│  │  │           ├─ model/
│  │  │           │  ├─ Book.java
│  │  │           │  ├─ Description.java
│  │  │           │  ├─ Author.java
│  │  │           │  └─ Genre.java
│  │  │           │
│  │  │           ├─ dto/
│  │  │           │  ├─ GenerateRequestDTO.java
│  │  │           │  ├─ GenerateResponseDTO.java
│  │  │           │  └─ DescriptionDTO.java
│  │  │           │
│  │  │           ├─ config/
│  │  │           │  ├─ WebConfig.java
│  │  │           │  └─ DatabaseConfig.java
│  │  │           │
│  │  │           └─ exception/
│  │  │              ├─ ApiException.java
│  │  │              └─ GlobalExceptionHandler.java
│  │  │
│  │  ├─ resources/
│  │  │  ├─ application.properties
│  │  │  ├─ static/
│  │  │  │  ├─ css/
│  │  │  │  │  └─ style.css
│  │  │  │  └─ js/
│  │  │  │     └─ app.js
│  │  │  └─ db/
│  │  │     └─ migration/
│  │  │        └─ V1__init_tables.sql
│  │  │
│  │  └─ webapp/
│  │     └─ WEB-INF/
│  │        └─ jsp/
│  │           │─ listbook.jsp                      # view for /listbook
│  │           ├─ generateInput.jsp                  # form /generateInput
│  │           ├─ generateConfirm.jsp                # show generated variants + Save
│  │           └─ bookdetails.jsp                    # /bookdetails (list saved descriptions + change)

```

#!/usr/bin/env bash
# Creates project folders and empty files for the Bookshop AI project.
# Usage:
#  - Git Bash: ./create_structure.sh /d/WorkshopAI/bookshop
#  - WSL: ./create_structure.sh /mnt/d/WorkshopAI/bookshop
set -e

ROOT="${1:-/d/WorkshopAI/bookshop}"  # change if needed

dirs=(
  "$ROOT/docs"
  "$ROOT/sql"
  "$ROOT/docker"
  "$ROOT/scripts"
  "$ROOT/src/main/java/vn/com/bookshopAI/controller"
  "$ROOT/src/main/java/vn/com/bookshopAI/service"
  "$ROOT/src/main/java/vn/com/bookshopAI/repository"
  "$ROOT/src/main/java/vn/com/bookshopAI/model"
  "$ROOT/src/main/java/vn/com/bookshopAI/dto"
  "$ROOT/src/main/java/vn/com/bookshopAI/config"
  "$ROOT/src/main/java/vn/com/bookshopAI/exception"
  "$ROOT/src/test/java/vn/com/bookshopAI/service"
  "$ROOT/src/test/java/vn/com/bookshopAI/controller"
  "$ROOT/src/main/resources"
  "$ROOT/src/main/resources/static/css"
  "$ROOT/src/main/resources/static/js"
  "$ROOT/src/main/resources/db/migration"
  "$ROOT/src/main/webapp/WEB-INF/jsp"
  "$ROOT/src/main/webapp/WEB-INF/jsp/fragments"
)

files=(
  "$ROOT/pom.xml"
  "$ROOT/.env.sample"
  "$ROOT/README.md"
  "$ROOT/LICENSE"
  "$ROOT/docs/basic-design.md"
  "$ROOT/docs/database-structure.md"
  "$ROOT/sql/bookshopai.sql"
  "$ROOT/docker/Dockerfile"
  "$ROOT/scripts/start.ps1"
  "$ROOT/src/main/resources/application.properties"
  "$ROOT/src/main/resources/static/css/style.css"
  "$ROOT/src/main/resources/static/js/app.js"
  "$ROOT/src/main/resources/db/migration/V1__init_tables.sql"
  "$ROOT/src/main/webapp/WEB-INF/jsp/fragments/header.jsp"
  "$ROOT/src/main/webapp/WEB-INF/jsp/fragments/footer.jsp"
  "$ROOT/src/main/webapp/WEB-INF/jsp/listbook.jsp"
  "$ROOT/src/main/webapp/WEB-INF/jsp/generateInput.jsp"
  "$ROOT/src/main/webapp/WEB-INF/jsp/generateConfirm.jsp"
  "$ROOT/src/main/webapp/WEB-INF/jsp/bookdetails.jsp"

  # Controllers
  "$ROOT/src/main/java/vn/com/bookshopAI/controller/BookListController.java"
  "$ROOT/src/main/java/vn/com/bookshopAI/controller/BookDetailsController.java"
  "$ROOT/src/main/java/vn/com/bookshopAI/controller/DescriptionConfirmController.java"
  "$ROOT/src/main/java/vn/com/bookshopAI/controller/DescriptionChangeController.java"
  "$ROOT/src/main/java/vn/com/bookshopAI/controller/AiGenerateController.java"

  # Services
  "$ROOT/src/main/java/vn/com/bookshopAI/service/BookService.java"
  "$ROOT/src/main/java/vn/com/bookshopAI/service/DescriptionService.java"
  "$ROOT/src/main/java/vn/com/bookshopAI/service/AiService.java"

  # Repositories
  "$ROOT/src/main/java/vn/com/bookshopAI/repository/BookRepository.java"
  "$ROOT/src/main/java/vn/com/bookshopAI/repository/DescriptionRepository.java"
  "$ROOT/src/main/java/vn/com/bookshopAI/repository/AuthorRepository.java"
  "$ROOT/src/main/java/vn/com/bookshopAI/repository/GenreRepository.java"

  # Models
  "$ROOT/src/main/java/vn/com/bookshopAI/model/Book.java"
  "$ROOT/src/main/java/vn/com/bookshopAI/model/Description.java"
  "$ROOT/src/main/java/vn/com/bookshopAI/model/Author.java"
  "$ROOT/src/main/java/vn/com/bookshopAI/model/Genre.java"

  # DTOs
  "$ROOT/src/main/java/vn/com/bookshopAI/dto/GenerateRequestDTO.java"
  "$ROOT/src/main/java/vn/com/bookshopAI/dto/GenerateResponseDTO.java"
  "$ROOT/src/main/java/vn/com/bookshopAI/dto/DescriptionDTO.java"

  # Config & Exception
  "$ROOT/src/main/java/vn/com/bookshopAI/config/WebConfig.java"
  "$ROOT/src/main/java/vn/com/bookshopAI/config/DatabaseConfig.java"
  "$ROOT/src/main/java/vn/com/bookshopAI/exception/ApiException.java"
  "$ROOT/src/main/java/vn/com/bookshopAI/exception/GlobalExceptionHandler.java"

  # Tests
  "$ROOT/src/test/java/vn/com/bookshopAI/service/AiServiceTest.java"
  "$ROOT/src/test/java/vn/com/bookshopAI/service/DescriptionServiceTest.java"
  "$ROOT/src/test/java/vn/com/bookshopAI/controller/BookListControllerTest.java"
)

echo "Creating directories..."
for d in "${dirs[@]}"; do
  mkdir -p "$d"
done

echo "Creating files..."
for f in "${files[@]}"; do
  if [ ! -e "$f" ]; then
    mkdir -p "$(dirname "$f")"
    touch "$f"
  fi
done

echo "Done. Project skeleton created at: $ROOT"
exit 0
// ...existing code...
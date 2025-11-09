# AI Bookshop Assistant

Module hỗ trợ tự động sinh mô tả sách bằng AI cho hệ thống quản lý cửa hàng sách.

## Tính năng chính

- Tự động sinh mô tả sách sử dụng AI dựa trên metadata của sách
- Hiển thị và cho phép lựa chọn từ nhiều phiên bản mô tả được tạo
- Lưu trữ và quản lý nhiều phiên bản mô tả cho mỗi cuốn sách
- Hỗ trợ tạo lại mô tả mới (Regenerate) mà không ghi đè phiên bản cũ
- Theo dõi lịch sử các phiên bản mô tả với thông tin thời gian và người tạo

## Yêu cầu hệ thống

- Java 1.8
- Spring Boot
- PostgreSQL
- Maven

## Cài đặt và Chạy

1. Clone repository:

```bash
git clone https://github.com/TonNa2025/bookshopai.git
cd bookshopai
```

1. Cấu hình database PostgreSQL:

- Tạo database mới với tên `bookshopai`
- Chạy script khởi tạo database trong thư mục `sql/bookshopai.sql`

1. Cấu hình application.properties:

```properties
# Database
spring.datasource.url=jdbc:postgresql://localhost:5432/bookshopai
spring.datasource.username=your_username
spring.datasource.password=your_password

# AI Service
ai.service.url=your_ai_service_url
ai.service.api-key=your_api_key
```

1. Build và chạy ứng dụng:

```bash
mvn clean install
mvn spring-boot:run
```

Ứng dụng sẽ chạy tại: `http://localhost:8080`

## Cấu trúc dự án

```plaintext
src/
├── main/
│   ├── java/vn/com/bookshopAI/
│   │   ├── config/         # Cấu hình ứng dụng
│   │   ├── controller/     # REST controllers
│   │   ├── dto/           # Data Transfer Objects
│   │   ├── exception/     # Exception handlers
│   │   ├── model/         # Entity models
│   │   ├── repository/    # Data repositories
│   │   └── service/       # Business logic
│   ├── resources/
│   │   ├── application.properties  # Cấu hình
│   │   ├── static/       # Static resources
│   │   └── db/migration/ # Database migrations
│   └── webapp/
│       └── WEB-INF/jsp/  # JSP views
```

## API Endpoints

- `GET /books` - Lấy danh sách sách
- `GET /books/{id}` - Xem chi tiết sách
- `POST /books/{id}/descriptions/generate` - Sinh mô tả mới cho sách
- `POST /books/{id}/descriptions/{descriptionId}/confirm` - Xác nhận và lưu mô tả
- `GET /books/{id}/descriptions` - Xem lịch sử các phiên bản mô tả

## License

MIT License - Xem file [LICENSE](LICENSE) để biết thêm chi tiết.

## Đóng góp

1. Fork dự án
2. Tạo branch mới (`git checkout -b feature/amazing_feature`)
3. Commit thay đổi (`git commit -m 'Add amazing feature'`)
4. Push lên branch (`git push origin feature/amazing_feature`)
5. Tạo Pull Request

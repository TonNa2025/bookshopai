# Basic Design - AI Bookshop Assistant

## 1. Tóm tắt dự án
Module: AI Bookshop Assistant  
Mục tiêu: Tự động sinh mô tả sách bằng AI, hiển thị, cho phép chọn/lưu nhiều phiên bản mô tả và tạo lại mô tả khi cần.

## 2. Ngôn ngữ & Stack
- Ngôn ngữ: Java 1.8
- Backend: Spring Boot
- Frontend: JSP
- Database: PostgreSQL
- Quản lý: 1 module (module AI Bookshop Assistant)
- Tài liệu: README.md

## 3. Yêu cầu chức năng (Functional)
1. Gọi AI để sinh mô tả sách (input: metadata sách, prompt tùy chọn).  
2. Hiển thị kết quả trả về từ AI (nhiều phiên bản).  
3. Cho phép chọn một phiên bản mô tả và lưu vào database.  
4. Hỗ trợ "Regenerate" (tạo lại mô tả) — lưu phiên bản mới mà không ghi đè.  
5. Danh sách mô tả đã lưu theo sách, có thông tin thời gian, tác giả (người chọn) và trạng thái.

## 4. Yêu cầu phi chức năng (Non-functional)
- Thời gian sinh mô tả: ≤ 5 giây (tối ưu gọi API và caching kết quả tạm thời).  
- Hỗ trợ nhiều phiên bản mô tả cho mỗi sách.  
- README.md hướng dẫn setup, chạy và cấu hình kết nối tới AI service & PostgreSQL.  
- Xử lý lỗi rõ ràng (thông báo cho người dùng khi lỗi kết nối AI/database).

## 5. Luồng nghiệp vụ (flows)
1. Người dùng mở trang sách → bấm "Generate description".  
2. Frontend gửi request metadata tới backend → backend gọi service AI.  
3. Backend nhận trả về nhiều mô tả → trả về cho frontend hiển thị.  
4. Người dùng chọn 1 mô tả → click "Save" → backend lưu DescriptionVersion liên kết với Book.  
5. Người dùng có thể bấm "Regenerate" để sinh phiên bản mới (lặp lại bước 2).

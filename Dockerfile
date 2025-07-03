# ใช้ base image ที่เป็น official ของ Nginx (แบบ alpine สำหรับขนาดเล็ก)
FROM nginx:alpine

# ลบ configuration default ที่มากับ image
RUN rm /etc/nginx/conf.d/default.conf

# คัดลอกไฟล์ nginx config ที่เราเตรียมไว้
COPY nginx.conf /etc/nginx/conf.d/default.conf

# คัดลอกไฟล์เว็บไซต์ static ไปยังตำแหน่งที่ใช้ของ Nginx
COPY index.html /usr/share/nginx/html/
COPY styles.css /usr/share/nginx/html/

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

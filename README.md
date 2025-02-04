# **🛒 Full-Stack Amazon-Clone App**  

<p align="center">
<img src="git_images/screenshot7.png" alt="App Screenshot 1" width="600" height="400">
</p>  

**A powerful, full-stack e-commerce application inspired by Amazon!** This app allows users to browse products, manage their cart, place orders, and make secure payments. It also includes an **admin dashboard** 🛠️ for managing product listings, tracking orders, and analyzing profits.  

---

## **✨ Features**  

### **👤 User Features**  
- 🔑 **User Authentication** – Secure login & registration with session management.  
- 🛍️ **Product Listings** – Dynamic catalog fetched via APIs.  
- 🔎 **Advanced Search** – Fast search using **regex** filters.  
- 🛒 **Cart Management** – Add, remove, and view items.  
- 📦 **Order Tracking** – Place orders and track real-time statuses.  
- 🔥 **Deals of the Day** – Personalized product deals based on ratings & demand.  
- ⭐ **Product Ratings** – Users can rate products, influencing deals & recommendations.  
- 💳 **Payment Integration** – Seamless payments via **Google Pay** & **Apple Pay**.  

### **🛠️ Admin Features**  
- 📦 **Product Management** – Add/update/delete products & manage stock levels.  
- 🚀 **Order Management** – Track, fulfill, and update order statuses.  
- 📊 **Profit Analysis** – Admin dashboard with charts displaying sales insights.  
- ⚡ **Intuitive Admin Panel** – Manage all functionalities with ease.  

---

## **🛠️ Tech Stack**  

- **Frontend:** 🖥️ Flutter (Dart) – Cross-platform mobile app.  
- **Backend:** ⚙️ Node.js + Express – Robust REST API.  
- **Database:** 🛢️ MongoDB – Secure storage for products, users & orders.  
- **Image Hosting:** 📷 Cloudinary – Efficient image management & hosting.  
- **Hosting:** 🚀 APIs deployed on **Render** for scalability & uptime.  

---

## **🏗️ Project Architecture**  

This app follows a **feature-first architecture** ensuring modularity and scalability:  

- 🏢 **Feature Modules** – Separate modules for authentication, cart, orders, etc.  
- 🎨 **Reusable Components** – Shared UI elements for consistency.  
- 🔄 **State Management** – Efficiently handled via the **Provider** package.  
- 📡 **Service Layer** – Centralized API calls for better reusability.  

---

## **🚀 Installation**  

### **Prerequisites**  
Ensure you have the following installed:  

- [Flutter](https://flutter.dev/docs/get-started/install) 🖥️  
- [Node.js](https://nodejs.org/en/) ⚙️  
- [MongoDB](https://www.mongodb.com/) 🛢️  
- [Git](https://git-scm.com/) 🌍  

### **Steps to Run Locally**  

1️⃣ **Clone the repository:**  
   ```bash
   git clone https://github.com/yourusername/amazon-clone.git
   cd amazon-clone
   ```  

2️⃣ **Frontend Setup:**  
   ```bash
   flutter pub get
   flutter run
   ```  

3️⃣ **Backend Setup:**  
   ```bash
   cd server
   npm install
   npm start
   ```  

4️⃣ **Database Setup:**  
   - Use **MongoDB Atlas** 🌍 (cloud) or run a local MongoDB instance.  

5️⃣ **Cloud Integration:**  
   - Configure **Cloudinary** for image hosting.  

---

## **📱 Showcase**  

<p align="center">
  <img src="git_images/screenshot1.jpg" width="200">
  <img src="git_images/screenshot2.jpg" width="200">
  <img src="git_images/screenshot3.jpg" width="200">
  <img src="git_images/screenshot4.jpg" width="200">
  <img src="git_images/screenshot5.jpg" width="200">
</p>  

👆 **A glimpse of the app in action!**  

---

## **📝 Class Diagram**  

<p align="center">
  <img src="git_images/class-diagram.svg" alt="SVG Class Diagram" width="400">
</p>  

📌 **Diagram illustrating the app's architecture & relationships.**  

---

## **📜 License**  

This project is licensed under the **MIT License**. See the [LICENSE](LICENSE) file for details.  


**Web** app for shops

---

- [ ] Create a separated **payment system** for testing
- [ ] Create a separated **authentication system** for testing
- [ ] Learn how to upload an **image** on a **database**

---

We will have a **template** used as base for each shop, changing only the **products, prices, categories and titles**
A different **slug** for each shop

The app will be splitted in **two parts**
1. **Home** - **Create** and **manage** your shop, or **search** for shops. Here will be also a dashboard `www.shop.com`
2. **Shop** - A single page for a shop `www.shop.com/<shop-name>`

---
# Stacks

Front-end: **React** with **Next.js** or **Vite**
Back-end: **NodeJS** with **Express.js** to communicate the **API**
Database: **MongoDB** or **MySql**
Authentication: **Express-Session**

---
# Home

Home will be split on three parts:

1. **Account** - **Edit** your information
2. **Shop Discovery** - To **search** for shops
3. **Dashboard** - Available only for **business accounts**
	- At the **first** time opening, you'll **create** your **shop page**
	- Edit your basic information
	- Add categories
	- Add products
	- Edit your template

---
# Shop

**CSS** will accept some changes like **color** and **display** for some specific elements
Exclusive stuff for each shop will be written as a **React component**, such as lists of **products**, **name** and **icon**

**User** will have a **buying car** for **this** shop, and when you add something to it, you're prompted to **finish**
Clicking on a product will take you to a more informative pop-up, and if the product can be modified, here will be the options for it, such as add something or add an observation
![[Pasted image 20231008154855.png]]
![[Pasted image 20231008155644.png]]
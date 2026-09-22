# Just2Profit — Full Starter

এই repository-তে Android User App, Admin Panel, Backend, Database এবং APK build workflow আছে।

## APK build
GitHub → Actions → Build Just2Profit APK → Run workflow.
Build সফল হলে Actions-এর Artifacts থেকে `Just2Profit-APK` download করবে।

## Backend
`backend/.env.example` কপি করে `.env` বানাতে হবে এবং PostgreSQL `DATABASE_URL` + শক্তিশালী `JWT_SECRET` দিতে হবে।

## Database
PostgreSQL-এ `database/schema.sql` চালাতে হবে।

## গুরুত্বপূর্ণ
এটি একটি functional starter। Real bKash/Nagad API, production admin authentication, payment reconciliation, KYC/AML, audit logging, rate limiting এবং production deployment আলাদা করে configure করতে হবে। Fake balance/payment proof ব্যবহার করা যাবে না।

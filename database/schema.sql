CREATE TABLE IF NOT EXISTS users (
 id BIGSERIAL PRIMARY KEY,
 full_name VARCHAR(120) NOT NULL,
 phone VARCHAR(30) UNIQUE NOT NULL,
 password_hash TEXT NOT NULL,
 referral_code VARCHAR(50) UNIQUE NOT NULL,
 referred_by VARCHAR(50),
 status VARCHAR(20) DEFAULT 'active',
 created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS wallets (
 user_id BIGINT PRIMARY KEY REFERENCES users(id) ON DELETE CASCADE,
 balance NUMERIC(14,2) DEFAULT 0 CHECK(balance >= 0),
 updated_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS tasks (
 id BIGSERIAL PRIMARY KEY,
 title VARCHAR(200) NOT NULL,
 description TEXT,
 reward NUMERIC(12,2) NOT NULL CHECK(reward >= 0),
 active BOOLEAN DEFAULT TRUE,
 created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS task_submissions (
 id BIGSERIAL PRIMARY KEY,
 task_id BIGINT REFERENCES tasks(id),
 user_id BIGINT REFERENCES users(id),
 proof TEXT,
 status VARCHAR(20) DEFAULT 'pending',
 submitted_at TIMESTAMPTZ DEFAULT NOW(),
 reviewed_at TIMESTAMPTZ
);

CREATE TABLE IF NOT EXISTS referrals (
 id BIGSERIAL PRIMARY KEY,
 referrer_id BIGINT REFERENCES users(id),
 referred_user_id BIGINT UNIQUE REFERENCES users(id),
 bonus NUMERIC(12,2) DEFAULT 0,
 created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS transactions (
 id BIGSERIAL PRIMARY KEY,
 user_id BIGINT REFERENCES users(id),
 type VARCHAR(40) NOT NULL,
 amount NUMERIC(14,2) NOT NULL,
 reference_id BIGINT,
 note TEXT,
 created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS withdrawals (
 id BIGSERIAL PRIMARY KEY,
 user_id BIGINT REFERENCES users(id),
 amount NUMERIC(14,2) NOT NULL CHECK(amount > 0),
 method VARCHAR(20) NOT NULL,
 account_number VARCHAR(40) NOT NULL,
 status VARCHAR(20) DEFAULT 'pending',
 created_at TIMESTAMPTZ DEFAULT NOW(),
 reviewed_at TIMESTAMPTZ
);

CREATE INDEX IF NOT EXISTS idx_tasks_active ON tasks(active);
CREATE INDEX IF NOT EXISTS idx_submissions_user ON task_submissions(user_id);
CREATE INDEX IF NOT EXISTS idx_transactions_user ON transactions(user_id);
CREATE INDEX IF NOT EXISTS idx_withdrawals_status ON withdrawals(status);

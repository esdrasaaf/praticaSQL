CREATE DATABASE "ecommerce";


-- Tabela de Usuários
CREATE TABLE "users" (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE,
    email TEXT NOT NULL UNIQUE,
    password TEXT NOT NULL
)

-- Tabela de Categorias
CREATE TABLE "categories" (
    id SERIAL PRIMARY KEY,
    name VARCHAR(30) NOT NULL UNIQUE
)

-- Tabela de Produtos
CREATE TABLE "products" (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE, 
    price INTEGER NOT NULL DEFAULT 0,
    main_photo TEXT NOT NULL UNIQUE,
    photo TEXT NOT NULL,
    category_id INTEGER NOT NULL REFERENCES "categories"("id"),
    size TEXT NOT NULL 
)

-- Tabela de Compras
CREATE TABLE "purchases" (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES "users"("id"),
    address_id INTEGER NOT NULL REFERENCES "address"("id"),
    product_id INTEGER NOT NULL REFERENCES "products"("id"),
    qtd INTEGER NOT NULL DEFAULT 0,
    actual_stage TEXT NOT NULL DEFAULT "criada",
    purchase_date DATE NOT NULL DEFAULT NOW()
)

-- Tabela de Endereços
CREATE TABLE "address" (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES "users"("id"),
    name VARCHAR(100) NOT NULL 
)
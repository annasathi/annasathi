-- AnnaSathi Enterprise Core OS - Relational Database Schema
-- Production Baseline Setup

-- 1. REGIONAL INTELLIGENCE LAYER: States & Union Territories Master Node
CREATE TABLE regions (
    id VARCHAR(5) PRIMARY KEY, -- e.g., 'UP', 'MH', 'DL'
    name VARCHAR(100) NOT NULL UNIQUE,
    is_union_territory BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- 2. GEOSPATIAL INTELLIGENCE LAYER: District Mandi Hubs Routing Table
CREATE TABLE mandi_hubs (
    id SERIAL PRIMARY KEY,
    state_id VARCHAR(5) REFERENCES regions(id) ON DELETE CASCADE,
    hub_name VARCHAR(100) NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT unique_state_hub UNIQUE(state_id, hub_name)
);

-- 3. AGRONOMIC LAYER: Crop Categories Classification
CREATE TABLE crop_categories (
    id SERIAL PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL UNIQUE -- e.g., 'Cereals & Grains', 'Oilseeds Matrix'
);

-- 4. MASTER DATA INFRASTRUCTURE: 105+ Crops Taxonomy Database
CREATE TABLE crops (
    id VARCHAR(50) PRIMARY KEY, -- e.g., 'paddy', 'wheat'
    category_id INT REFERENCES crop_categories(id),
    name_en VARCHAR(100) NOT NULL,
    name_hi VARCHAR(100) NOT NULL,
    base_mandi_price_per_qtl NUMERIC(10, 2) NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- 5. RESOLUTION DESK PROTOCOLS: 100 Hardships Multilingual Dictionary
CREATE TABLE hardship_protocols (
    id VARCHAR(10) PRIMARY KEY, -- e.g., 'p1', 'p2', 'p23'
    module_group VARCHAR(100) NOT NULL,
    title_hi VARCHAR(255) NOT NULL,
    title_en VARCHAR(255) NOT NULL,
    ground_steps_hi TEXT NOT NULL,
    ground_steps_en TEXT NOT NULL,
    automation_text_hi TEXT NOT NULL,
    automation_text_en TEXT NOT NULL,
    action_btn_text_hi VARCHAR(100) NOT NULL,
    action_btn_text_en VARCHAR(100) NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

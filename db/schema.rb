# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2026_08_31_142508) do
  create_table "active_storage_attachments", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.string "name", null: false
    t.bigint "record_id", null: false
    t.string "record_type", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.string "content_type"
    t.datetime "created_at", null: false
    t.string "filename", null: false
    t.string "key", null: false
    t.text "metadata"
    t.string "service_name", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "carrinhos", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clientes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "nome"
    t.datetime "remember_created_at"
    t.datetime "reset_password_sent_at"
    t.string "reset_password_token"
    t.string "telefone"
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_clientes_on_email", unique: true
    t.index ["reset_password_token"], name: "index_clientes_on_reset_password_token", unique: true
  end

  create_table "item_carrinhos", force: :cascade do |t|
    t.integer "carrinho_id", null: false
    t.datetime "created_at", null: false
    t.integer "produto_id", null: false
    t.integer "quantidade"
    t.datetime "updated_at", null: false
    t.index ["carrinho_id"], name: "index_item_carrinhos_on_carrinho_id"
    t.index ["produto_id"], name: "index_item_carrinhos_on_produto_id"
  end

  create_table "item_pedidos", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "pedido_id", null: false
    t.decimal "preco_unitario"
    t.integer "produto_id", null: false
    t.integer "quantidade"
    t.datetime "updated_at", null: false
    t.index ["pedido_id"], name: "index_item_pedidos_on_pedido_id"
    t.index ["produto_id"], name: "index_item_pedidos_on_produto_id"
  end

  create_table "pedidos", force: :cascade do |t|
    t.integer "cliente_id", null: false
    t.datetime "created_at", null: false
    t.string "mp_payment_id"
    t.text "pix_copia_e_cola"
    t.text "pix_qrcode_base64"
    t.string "status"
    t.decimal "total"
    t.datetime "updated_at", null: false
    t.index ["cliente_id"], name: "index_pedidos_on_cliente_id"
  end

  create_table "produtos", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.text "descricao"
    t.integer "estoque"
    t.string "nome"
    t.decimal "preco"
    t.datetime "updated_at", null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "item_carrinhos", "carrinhos"
  add_foreign_key "item_carrinhos", "produtos"
  add_foreign_key "item_pedidos", "pedidos"
  add_foreign_key "item_pedidos", "produtos"
  add_foreign_key "pedidos", "clientes"
end

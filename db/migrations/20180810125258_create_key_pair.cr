class CreateKeyPair::V20180810125258 < LuckyMigrator::Migration::V1
  def migrate
    create :key_pairs do
      add user_id : Int32
      add public_key : String
      add private_key : String
    end
  end

  def rollback
    drop :key_pairs
  end
end

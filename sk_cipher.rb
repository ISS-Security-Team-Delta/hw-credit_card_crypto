require 'base64'
require 'rbnacl'
module ModernSymmetricCipher
  def self.generate_new_key
    # TODO: Return a new key as a Base64 string
    Base64.strict_encode64(RbNaCl::Random.random_bytes(RbNaCl::SecretBox.key_bytes))
  end

  def self.encrypt(document, key)
    # TODO: Return an encrypted string
    #       Use base64 for ciphertext so that it is sendable as text
    key = Base64.strict_decode64(key)
    cipher = RbNaCl::SimpleBox.from_secret_key(key)
    Base64.strict_encode64(cipher.encrypt(document))
  end

  def self.decrypt(encrypted_cc, key)
    # TODO: Decrypt from encrypted message above
    #       Expect Base64 encrypted message and Base64 key
    ciphertext = Base64.strict_decode64(encrypted_cc)
    key = Base64.strict_decode64(key)
    cipher = RbNaCl::SimpleBox.from_secret_key(key)
    cipher.decrypt(ciphertext)
  end
end

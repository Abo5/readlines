# readlines/lib/readlines/readlines/content.rb
require 'fileutils'
require 'json'

module Readlines
    module Content
        def reverse_content_now
            raise Readlines::NotFoundError, "File not found: #{@file_path}" unless ::File.exist?(@file_path)

            content = ::File.readlines(@file_path)
            reversed_content = content.reverse.join
            ::File.write(@file_path, reversed_content)
            reversed_content
        end

        def validate_content_now(rules)
            raise Readlines::NotFoundError, "File not found: #{@file_path}" unless ::File.exist?(@file_path)

            content = ::File.readlines(@file_path)
            content.all? do |line|
                rules.all? { |rule| line.match?(rule) }
            end
        end

        def encrypt_content_now(key)
            raise Readlines::NotFoundError, "File not found: #{@file_path}" unless ::File.exist?(@file_path)

            content = ::File.read(@file_path)
            encrypted_content = content.chars.map { |char| (char.ord + key).chr }.join
            encrypted_file_name = "#{@file_path}.encrypted"
            ::File.write(encrypted_file_name, encrypted_content)
            encrypted_file_name
        end

        def decrypt_content_now(key, encrypted_file_path)
            raise Readlines::NotFoundError, "File not found: #{encrypted_file_path}" unless ::File.exist?(encrypted_file_path)

            encrypted_content = ::File.read(encrypted_file_path)
            decrypted_content = encrypted_content.chars.map { |char| (char.ord - key).chr }.join
            decrypted_file_name = encrypted_file_path.sub('.encrypted', '')
            ::File.write(decrypted_file_name, decrypted_content)
            decrypted_file_name
        end
    end
end

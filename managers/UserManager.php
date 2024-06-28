<?php


class UserManager extends AbstractManager
{

    public function createUser(User $user): void
    {
        $insertUserQuery = $this->db->prepare('INSERT INTO users (username, email, password, country_id, language_id, role, date) VALUES (:username, :email, :password, :country_id, :language_id, :role, :date)');
        $parameters = [
            'username' => $user->getUsername(),
            'email' => $user->getEmail(),
            'password' => $user->getPassword(),
            'country_id' => $user->getCountry()->getId(),
            'language_id' => $user->getLanguage()->getId(),
            'role' => $user->getRole(),
            'date' => $user->getDate(),
        ];
        $insertUserQuery->execute($parameters);
    }

    public function getUserByEmail($email): ?User
    {
        $selectUserByEmailQuery = $this->db->prepare('SELECT * FROM users WHERE email = :email');
        $parameters = [
            'email' => $email
        ];
        $selectUserByEmailQuery->execute($parameters);
        $user_data = $selectUserByEmailQuery->fetch(PDO::FETCH_ASSOC);

        if ($user_data) {

            $countryManager = new CountryManager();
            $languageManager = new LanguageManager();

            $country = $countryManager->getOneCountryById($user_data['country_id']);
            $language = $languageManager->getOneLanguageById($user_data['language_id']);

            $user = new User($user_data['username'], $user_data['email'], $user_data['password'], $country, $language, date('Y-m-d'));
            $user->setPicture($user_data['picture']);
            $user->setId($user_data['id']);
            $user->setRole($user_data['role']);

            $_SESSION['connexion'] = 'autorise';

            return $user;
        } else {
            return null;
        }
    }

    public function getUserById(int $id): ?User
    {
        $selectUserByEmailQuery = $this->db->prepare('SELECT * FROM users WHERE id = :id');
        $parameters = [
            'id' => $id
        ];
        $selectUserByEmailQuery->execute($parameters);
        $user_data = $selectUserByEmailQuery->fetch(PDO::FETCH_ASSOC);

        if ($user_data) {

            $countryManager = new CountryManager();
            $languageManager = new LanguageManager();

            $country = $countryManager->getOneCountryById($user_data['country_id']);
            $language = $languageManager->getOneLanguageById($user_data['language_id']);

            $user = new User($user_data['username'], $user_data['email'], $user_data['password'], $country, $language, date('Y-m-d'));
            $user->setPicture($user_data['picture']);
            $user->setId($user_data['id']);
            $user->setRole($user_data['role']);

            return $user;
        } else {
            return null;
        }
    }

    public function getAllUsers(): ?array
    {
        $selectAllUsersQuery = $this->db->prepare('SELECT * FROM users');
        $selectAllUsersQuery->execute();
        $users_data = $selectAllUsersQuery->fetchAll(PDO::FETCH_ASSOC);

        if ($users_data) {
            $users_array = [];

            $countryManager = new CountryManager();
            $languageManager = new LanguageManager();

            foreach ($users_data as $user_data) {
                $country = $countryManager->getOneCountryById($user_data['country_id']);
                $language = $languageManager->getOneLanguageById($user_data['language_id']);
                $user = new User($user_data['username'], $user_data['email'], $user_data['password'], $country, $language, date('Y-m-d'));
                $user->setPicture($user_data['picture']);
                $user->setId($user_data['id']);
                $user->setRole($user_data['role']);
                $users_array[] = $user;
            }

            return $users_array;
        } else {
            return null;
        }
    }

    public function deleteUser(int $id): void
    {
        $updateQuery = $this->db->prepare('UPDATE users SET username = :default_name, email = :default_email, password = :default_password, country_id = 0, language_id = 0, picture = :default_picture, role = :default, date = :none WHERE id = :id');
        $parameters = [
            'default_name' => "default",
            'default_email' => "default@email.default",
            'default_password' => "default_password",
            'default_picture' => "default_picture",
            'default' => 0,
            'none' => "default_date",
            'id' => $id
        ];
        $updateQuery->execute($parameters);
    }

    public function updateUserRole(string $role, int $id): void
    {
        $updateRoleQuery = $this->db->prepare('UPDATE users SET role = :nouveau_role WHERE id = :id');
        $parameters = ['nouveau_role' => $role, 'id' => $id];
        $updateRoleQuery->execute($parameters);
    }

    public function updateUserImage(int $user_id, string $imgSrc): void
    {
        $updateImageQuery = $this->db->prepare('UPDATE users SET picture = :picture WHERE id = :user_id');

        $parameters = [
            'user_id' => $user_id,
            'picture' => $imgSrc,
        ];

        $updateImageQuery->execute($parameters);
    }
}

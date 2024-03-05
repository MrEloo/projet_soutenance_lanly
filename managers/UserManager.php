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

            return $user;
        } else {
            return null;
        }
    }
}

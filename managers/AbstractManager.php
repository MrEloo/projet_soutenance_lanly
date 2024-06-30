<?php

abstract class AbstractManager
{
    protected PDO $db;

    public function __construct()
    {
        try {
            $connexion = "mysql:host=" . $_ENV["DB_HOST"] . ";port=3306;charset=" . $_ENV["DB_CHARSET"] . ";dbname=" . $_ENV["DB_NAME"];
            $this->db = new PDO(
                $connexion,
                $_ENV["DB_USER"],
                $_ENV["DB_PASSWORD"]
            );
        } catch (PDOException $e) {
            echo "Erreur de connexion à la base de données : " . $e->getMessage();
        }
    }

    public function verifyLanguage(string $name)
    {
        try {
            $allowed_languages = ['en', 'fr', 'es', 'ru', 'it', 'de'];
            $user_lang = $_SESSION['user_lang'] ?? null;

            if (!in_array($user_lang, $allowed_languages, true)) {
                throw new InvalidArgumentException('Langue non autorisée');
            } else {
                return "{$name}_{$user_lang}";
            }
        } catch (InvalidArgumentException $e) {
            echo "La langue n'est pas valide : " . $e->getMessage();
        }
    }

    public function verifyLanguageId()
    {

        try {
            $languageId = $_SESSION['user_language'];

            if (!is_numeric($languageId)) {
                throw new InvalidArgumentException('id non correspondant');
            } else {
                return $languageId;
            }
        } catch (InvalidArgumentException $e) {
            echo "L'id de la langue n'est pas valide : " . $e->getMessage();
        }
    }
}

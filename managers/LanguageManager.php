<?php


class LanguageManager extends AbstractManager
{
    public function getAllLanguages(): ?array
    {
        $selectAllLanguagesQuery = $this->db->prepare("SELECT * FROM languages_{$_SESSION['user_lang']}");
        $selectAllLanguagesQuery->execute();
        $languages_datas = $selectAllLanguagesQuery->fetchAll(PDO::FETCH_ASSOC);

        if ($languages_datas) {
            $languages_array = [];

            foreach ($languages_datas as $language_data) {
                $language = new Language(strtolower($language_data['name']), $language_data['drapeau']);
                $language->setId($language_data['id']);
                $language->setCode($language_data['code']);
                $languages_array[] = $language;
            }

            return $languages_array;
        } else {
            return null;
        }
    }

    public function getOneLanguageByName(string $name): ?Language
    {
        $selectLanguageByNameQuery = $this->db->prepare("SELECT * from languages_{$_SESSION['user_lang']} WHERE name = :name");
        $parameters = [
            'name' => $name
        ];
        $selectLanguageByNameQuery->execute($parameters);
        $language_data =  $selectLanguageByNameQuery->fetch(PDO::FETCH_ASSOC);

        if ($language_data) {
            $language = new Language(strtolower($language_data['name']), $language_data['drapeau']);
            $language->setId($language_data['id']);
            $language->setCode($language_data['code']);
            return $language;
        } else {
            return null;
        }
    }

    public function getOneLanguageById(?int $id): ?Language
    {
        $selectLanguageByNameQuery = $this->db->prepare("SELECT * from languages_{$_SESSION['user_lang']} WHERE id = :id");
        $parameters = [
            'id' => $id
        ];
        $selectLanguageByNameQuery->execute($parameters);
        $language_data =  $selectLanguageByNameQuery->fetch(PDO::FETCH_ASSOC);

        if ($language_data) {
            $language = new Language(strtolower($language_data['name']), $language_data['drapeau']);
            $language->setId($language_data['id']);
            $language->setCode($language_data['code']);
            return $language;
        } else {
            return null;
        }
    }

    public function addLanguage(string $name, string $drapeau): void
    {
        $insertLanguage_deQuery = $this->db->prepare('INSERT INTO languages_de (name, drapeau) VALUES (:name, :drapeau)');
        $insertLanguage_enQuery = $this->db->prepare('INSERT INTO languages_en (name, drapeau) VALUES (:name, :drapeau)');
        $insertLanguage_esQuery = $this->db->prepare('INSERT INTO languages_es (name, drapeau) VALUES (:name, :drapeau)');
        $insertLanguage_frQuery = $this->db->prepare('INSERT INTO languages_fr (name, drapeau) VALUES (:name, :drapeau)');
        $insertLanguage_itQuery = $this->db->prepare('INSERT INTO languages_it (name, drapeau) VALUES (:name, :drapeau)');
        $insertLanguage_ruQuery = $this->db->prepare('INSERT INTO languages_ru (name, drapeau) VALUES (:name, :drapeau)');

        $parameters = [
            'name' => $name,
            'drapeau' => $drapeau,
        ];

        $insertLanguage_deQuery->execute($parameters);
        $insertLanguage_enQuery->execute($parameters);
        $insertLanguage_esQuery->execute($parameters);
        $insertLanguage_frQuery->execute($parameters);
        $insertLanguage_itQuery->execute($parameters);
        $insertLanguage_ruQuery->execute($parameters);
    }

    public function deleteLanguage(int $language_id): void
    {
        $deleteExample_deQuery = $this->db->prepare('DELETE FROM languages_de WHERE id = :language_id');
        $deleteExample_enQuery = $this->db->prepare('DELETE FROM languages_en WHERE id = :language_id');
        $deleteExample_esQuery = $this->db->prepare('DELETE FROM languages_es WHERE id = :language_id');
        $deleteExample_frQuery = $this->db->prepare('DELETE FROM languages_fr WHERE id = :language_id');
        $deleteExample_itQuery = $this->db->prepare('DELETE FROM languages_it WHERE id = :language_id');
        $deleteExample_ruQuery = $this->db->prepare('DELETE FROM languages_ru WHERE id = :language_id');

        $parameters = [
            'language_id' => $language_id
        ];

        $deleteExample_deQuery->execute($parameters);
        $deleteExample_enQuery->execute($parameters);
        $deleteExample_esQuery->execute($parameters);
        $deleteExample_frQuery->execute($parameters);
        $deleteExample_itQuery->execute($parameters);
        $deleteExample_ruQuery->execute($parameters);
    }
}

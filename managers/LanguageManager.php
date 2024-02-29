<?php


class LanguageManager extends AbstractManager
{
    public function getAllLanguages(): array
    {
        $selectAllLanguagesQuery = $this->db->prepare('SELECT * FROM languages');
        $selectAllLanguagesQuery->execute();
        $languages_datas = $selectAllLanguagesQuery->fetchAll(PDO::FETCH_ASSOC);

        $languages_array = [];

        foreach ($languages_datas as $language_data) {
            $language = new Language($language_data['name'], $language_data['drapeau']);
            $language->setId($language_data['id']);
            $languages_array[] = $language;
        }

        return $languages_array;
    }

    public function getOneLanguageByName(string $name): Language
    {
        $selectLanguageByNameQuery = $this->db->prepare('SELECT * from languages WHERE name = :name');
        $parameters = [
            'name' => $name
        ];
        $selectLanguageByNameQuery->execute($parameters);
        $language_data =  $selectLanguageByNameQuery->fetch(PDO::FETCH_ASSOC);
        var_dump($language_data);

        $language = new Language($language_data['name'], $language_data['drapeau']);
        $language->setId($language_data['id']);
        return $language;
    }

    public function getOneLanguageById(?int $id): ?Language
    {
        $selectLanguageByNameQuery = $this->db->prepare('SELECT * from languages WHERE id = :id');
        $parameters = [
            'id' => $id
        ];
        $selectLanguageByNameQuery->execute($parameters);
        $language_data =  $selectLanguageByNameQuery->fetch(PDO::FETCH_ASSOC);

        if ($language_data) {
            $language = new Language($language_data['name'], $language_data['drapeau']);
            $language->setId($language_data['id']);
            return $language;
        } else {
            return null;
        }
    }
}

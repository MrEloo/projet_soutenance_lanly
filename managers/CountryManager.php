<?php


class CountryManager extends AbstractManager
{
    public function getOneCountryByName(string $name): Country
    {
        $selectCountryByNameQuery = $this->db->prepare("SELECT * FROM contries_{$_SESSION['user_lang']} WHERE name = :name");
        $parameters = [
            'name' => $name
        ];
        $selectCountryByNameQuery->execute($parameters);
        $country_data =  $selectCountryByNameQuery->fetch(PDO::FETCH_ASSOC);

        $languageManager = new LanguageManager();
        $language = $languageManager->getOneLanguageById($country_data['language_id']);

        $country = new Country($country_data['name'], $country_data['nb_people'], $language);
        $country->setId($country_data['id']);
        return $country;
    }

    public function getOneCountryById(?int $id): ?Country
    {
        $selectCountryByIdQuery = $this->db->prepare("SELECT * from contries_{$_SESSION['user_lang']} WHERE id = :id");
        $parameters = [
            'id' => $id
        ];
        $selectCountryByIdQuery->execute($parameters);
        $country_data =  $selectCountryByIdQuery->fetch(PDO::FETCH_ASSOC);

        if ($country_data) {
            $languageManager = new LanguageManager();
            $language = $languageManager->getOneLanguageById($country_data['language_id']);

            $country = new Country($country_data['name'], $country_data['nb_people'], $language);
            $country->setId($country_data['id']);
            return $country;
        } else {
            return null;
        }
    }
}

<?php


class CountryManager extends AbstractManager
{


    public function getOneCountryByName(string $name): ?Country
    {
        if (!$this->verifyLanguage('contries')) {
            $table = $this->verifyLanguage('contries');

            $selectCountryByNameQuery = $this->db->prepare("SELECT * FROM $table WHERE name = :name");
            $parameters = [
                'name' => $name
            ];
            $selectCountryByNameQuery->execute($parameters);
            $country_data =  $selectCountryByNameQuery->fetch(PDO::FETCH_ASSOC);

            if ($country_data) {
                $languageManager = new LanguageManager();
                $language = $languageManager->getOneLanguageById($country_data['language_id']);

                $country = new Country($country_data['name'], $country_data['nb_people'], $language);
                $country->setId($country_data['id']);
                return $country;
            } else {
                return null;
            }
        } else {
            return null;
        }
    }

    public function getOneCountryById(?int $id): ?Country
    {

        if ($this->verifyLanguage('contries')) {
            $table = $this->verifyLanguage('contries');


            $selectCountryByIdQuery = $this->db->prepare("SELECT * from $table WHERE id = :id");
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
        } else {
            return null;
        }
    }

    public function getAllCountries(): ?array
    {
        if ($this->verifyLanguage('contries')) {
            $table = $this->verifyLanguage('contries');

            $selectAllCountryQuery = $this->db->prepare("SELECT * FROM $table");
            $selectAllCountryQuery->execute();
            $country_datas =  $selectAllCountryQuery->fetchAll(PDO::FETCH_ASSOC);


            $countries_arrray = [];

            if ($country_datas) {

                foreach ($country_datas as $key => $country_data) {
                    $languageManager = new LanguageManager();
                    $language = $languageManager->getOneLanguageById($country_data['language_id']);

                    $country = new Country($country_data['name'], $country_data['nb_people'], $language);
                    $country->setId($country_data['id']);
                    $countries_arrray[] = $country;
                }
                return $countries_arrray;
            } else {
                return null;
            }
        } else {
            return null;
        }
    }
}

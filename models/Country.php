<?php


class Country
{
    private ?int $id = null;

    public function __construct(private string $name, private int $nb_people, private Language $language)
    {
        $this->name = $name;
        $this->nb_people = $nb_people;
        $this->language = $language;
    }

    /**
     * Get the value of id
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Set the value of id
     *
     * @return  self
     */
    public function setId($id)
    {
        $this->id = $id;

        return $this;
    }

    /**
     * Get the value of name
     */
    public function getName()
    {
        return $this->name;
    }

    /**
     * Set the value of name
     *
     * @return  self
     */
    public function setName($name)
    {
        $this->name = $name;

        return $this;
    }

    /**
     * Get the value of nb_people
     */
    public function getNb_people()
    {
        return $this->nb_people;
    }

    /**
     * Set the value of nb_people
     *
     * @return  self
     */
    public function setNb_people($nb_people)
    {
        $this->nb_people = $nb_people;

        return $this;
    }

    /**
     * Get the value of language
     */
    public function getLanguage()
    {
        return $this->language;
    }

    /**
     * Set the value of language
     *
     * @return  self
     */
    public function setLanguage($language)
    {
        $this->language = $language;

        return $this;
    }
}

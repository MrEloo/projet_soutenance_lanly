<?php


class Country
{
    private ?int $id = null;

    public function __construct(
        private string $name,
        private int $nb_people,
        private Language $language
    ) {
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function setId(?int $id): self
    {
        $this->id = $id;
        return $this;
    }

    public function getName(): string
    {
        return $this->name;
    }

    public function setName(string $name): self
    {
        $this->name = $name;
        return $this;
    }

    public function getNb_people(): int
    {
        return $this->nb_people;
    }

    public function setNb_people(int $nb_people): self
    {
        $this->nb_people = $nb_people;
        return $this;
    }

    public function getLanguage(): Language
    {
        return $this->language;
    }

    public function setLanguage(Language $language): self
    {
        $this->language = $language;
        return $this;
    }
}

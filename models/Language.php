<?php


class Language
{
    private ?int $id = null;
    private string $code;
    private bool $hasCourse;

    public function __construct(private string $name, private string $drapeau)
    {
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

    public function getDrapeau(): string
    {
        return $this->drapeau;
    }

    public function setDrapeau(string $drapeau): self
    {
        $this->drapeau = $drapeau;
        return $this;
    }

    public function getCode(): string
    {
        return $this->code;
    }

    public function setCode(string $code): self
    {
        $this->code = $code;
        return $this;
    }

    public function getHasCourse(): bool
    {
        return $this->hasCourse;
    }

    public function setHasCourse(bool $hasCourse): self
    {
        $this->hasCourse = $hasCourse;
        return $this;
    }
}

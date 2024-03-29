<?php


class Example
{
    private ?int $id = null;
    private int $course_id;
    private int $language_id;

    public function __construct(private string $description)
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

    public function getDescription(): string
    {
        return $this->description;
    }

    public function setDescription(string $description): self
    {
        $this->description = $description;
        return $this;
    }

    public function getCourse_id(): int
    {
        return $this->course_id;
    }

    public function setCourse_id(int $course_id): self
    {
        $this->course_id = $course_id;
        return $this;
    }

    public function getLanguage_id(): int
    {
        return $this->language_id;
    }

    public function setLanguage_id(int $language_id): self
    {
        $this->language_id = $language_id;
        return $this;
    }
}

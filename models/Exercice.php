<?php


class Exercice
{
    private ?int $id = null;
    private Response $response;
    private ?int $result;

    public function __construct(
        private string $title,
        private string $difficulty,
        private string $question,
        private string $correction_Text,
        private string $correction,
        private GlobalCategory $globalCategory,
        private int $course_id
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

    public function getDifficulty(): string
    {
        return $this->difficulty;
    }

    public function setDifficulty(string $difficulty): self
    {
        $this->difficulty = $difficulty;
        return $this;
    }

    public function getQuestion(): string
    {
        return $this->question;
    }

    public function setQuestion(string $question): self
    {
        $this->question = $question;
        return $this;
    }

    public function getCorrection(): string
    {
        return $this->correction;
    }

    public function setCorrection(string $correction): self
    {
        $this->correction = $correction;
        return $this;
    }

    public function getGlobalCategory(): GlobalCategory
    {
        return $this->globalCategory;
    }

    public function setGlobalCategory(GlobalCategory $globalCategory): self
    {
        $this->globalCategory = $globalCategory;
        return $this;
    }

    public function getTitle(): string
    {
        return $this->title;
    }

    public function setTitle(string $title): self
    {
        $this->title = $title;
        return $this;
    }

    public function getCorrection_Text(): string
    {
        return $this->correction_Text;
    }

    public function setCorrection_Text(string $correction_Text): self
    {
        $this->correction_Text = $correction_Text;
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

    public function getResponse(): Response
    {
        return $this->response;
    }

    public function setResponse(Response $response): self
    {
        $this->response = $response;
        return $this;
    }

    public function getResult(): ?int
    {
        return $this->result;
    }

    public function setResult(?int $result): self
    {
        $this->result = $result;
        return $this;
    }
}

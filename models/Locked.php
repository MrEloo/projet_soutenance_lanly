<?php

class Locked
{
    private ?int $id;

    public function __construct(private User $user, private Course $course, private bool $isLocked)
    {
        $this->user = $user;
        $this->course= $course;
        $this->isLocked = $isLocked;
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
         * Get the value of user
         */ 
        public function getUser()
        {
                return $this->user;
        }

        /**
         * Set the value of user
         *
         * @return  self
         */ 
        public function setUser($user)
        {
                $this->user = $user;

                return $this;
        }

        /**
         * Get the value of course
         */ 
        public function getCourse()
        {
                return $this->course;
        }

        /**
         * Set the value of course
         *
         * @return  self
         */ 
        public function setCourse($course)
        {
                $this->course = $course;

                return $this;
        }

        /**
         * Get the value of isLocked
         */ 
        public function getIsLocked()
        {
                return $this->isLocked;
        }

        /**
         * Set the value of isLocked
         *
         * @return  self
         */ 
        public function setIsLocked($isLocked)
        {
                $this->isLocked = $isLocked;

                return $this;
        }
}

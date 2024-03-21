<?php


class ReasonManager extends AbstractManager
{

    public function getAllReasons(): array
    {
        $selectUserReasonsQuery = $this->db->prepare("SELECT * FROM reasons_{$_SESSION['user_lang']}");
        $selectUserReasonsQuery->execute();

        $reasons_datas = $selectUserReasonsQuery->fetchAll(PDO::FETCH_ASSOC);

        $reasons_array = [];

        foreach ($reasons_datas as $key => $reason_data) {
            $reason = new Reason(strtolower($reason_data['name']));
            $reason->setId($reason_data['id']);
            $reasons_array[] = $reason;
        }
        return $reasons_array;
    }

    public function getReasonByName(string $name): ?Reason
    {
        $selectReasonQuery = $this->db->prepare("SELECT * FROM reasons_{$_SESSION['user_lang']} WHERE name =:name");
        $parameters = ['name' => $name];
        $selectReasonQuery->execute($parameters);

        $reason_data = $selectReasonQuery->fetch(PDO::FETCH_ASSOC);

        if ($reason_data) {
            $reason = new Reason(strtolower($reason_data['name']));
            $reason->setId($reason_data['id']);

            return $reason;
        } else {
            return null;
        }
    }

    public function addUserReason(int $user_id, int $reason_id): void
    {
        $insertReasonQuery = $this->db->prepare("INSERT INTO users_reasons (user_id, reason_id) VALUES (:user_id, :reason_id)");

        $parameters = [
            'user_id' => $user_id,
            'reason_id' => $reason_id
        ];

        $insertReasonQuery->execute($parameters);
    }

    public function getUserReasons(int $user_id, int $reason_id): ?Reason
    {
        $selectUserReasonsQuery = $this->db->prepare("SELECT * FROM users_reasons WHERE user_id = :user_id AND reason_id =:reason_id");
        $parameters = [
            'user_id' => $user_id,
            'reason_id' => $reason_id
        ];
        $selectUserReasonsQuery->execute($parameters);

        $reason_data = $selectUserReasonsQuery->fetch(PDO::FETCH_ASSOC);

        if ($reason_data) {
            $reason = new Reason(strtolower($reason_data['name']));
            $reason->setId($reason_data['id']);

            return $reason;
        } else {
            return null;
        }
    }
}

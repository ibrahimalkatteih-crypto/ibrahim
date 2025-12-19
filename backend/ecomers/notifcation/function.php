<?php

require __DIR__ . '/../vendor/autoload.php';

use Kreait\Firebase\Factory;
use Kreait\Firebase\Messaging\CloudMessage;
use Kreait\Firebase\Messaging\Notification;

function sendGCM($title, $message, $topic, $pageid, $pagename)
{
    try {
        // تهيئة Firebase باستخدام مفتاح الخدمة
        $factory = (new Factory)
            ->withServiceAccount(__DIR__ . '/../ecommers-9ae84-0af4a6887f48.json');

        $messaging = $factory->createMessaging();

        // إنشاء الإشعار
        $notification = Notification::create($title, $message);

        // بيانات إضافية
        $data = [
            'pageid' => $pageid,
            'pagename' => $pagename,
        ];

        // إنشاء الرسالة الموجهة إلى Topic
        $cloudMessage = CloudMessage::withTarget('topic', $topic)
            ->withNotification($notification)
            ->withData($data);

        // إرسال الرسالة
        $result = $messaging->send($cloudMessage);

        return [
            'status' => 'success',
            'message_id' => $result,
        ];
    } catch (Exception $e) {
                echo "notifcation=========================";

        return [
            'status' => 'error',
            'error' => $e->getMessage(),
        ];
        
    }
}

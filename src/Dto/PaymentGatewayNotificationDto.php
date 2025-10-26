<?php
declare(strict_types=1);

namespace BlackCat\Database\Packages\PaymentGatewayNotifications\Dto;

/**
 * Jednoduché, neměnné DTO s veřejnými readonly vlastnostmi.
 * - Bez logiky; pouze nosič dat.
 * - Silné typy drží kontrakt napříč vrstvami.
 */
final class PaymentGatewayNotificationDto {
    public function __construct(
        public readonly ?int $id,
        public readonly string $transactionId,
        public readonly \DateTimeImmutable $receivedAt,
        public readonly int $version,
        public readonly ?string $processingBy,
        public readonly ?\DateTimeImmutable $processingUntil,
        public readonly int $attempts,
        public readonly ?string $lastError,
        public readonly string $status
    ) {}

    /** Vhodné pro serializaci/logování (bez velkých blobů). */
    public function toArray(): array {
        return get_object_vars($this);
    }
}

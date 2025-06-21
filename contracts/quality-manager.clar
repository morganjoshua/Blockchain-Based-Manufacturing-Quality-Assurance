;; Quality Manager Verification Contract
;; Manages verification and authorization of quality managers

(define-map quality-managers principal {
    name: (string-ascii 50),
    certification: (string-ascii 100),
    verified: bool,
    verification-date: uint
})

(define-map manager-permissions principal {
    can-schedule-inspections: bool,
    can-track-defects: bool,
    can-create-corrective-actions: bool,
    can-manage-improvements: bool
})

(define-data-var contract-owner principal tx-sender)

;; Error constants
(define-constant ERR-NOT-AUTHORIZED (err u100))
(define-constant ERR-MANAGER-NOT-FOUND (err u101))
(define-constant ERR-ALREADY-VERIFIED (err u102))

;; Register a new quality manager
(define-public (register-manager (manager principal) (name (string-ascii 50)) (certification (string-ascii 100)))
    (begin
        (asserts! (is-eq tx-sender (var-get contract-owner)) ERR-NOT-AUTHORIZED)
        (map-set quality-managers manager {
            name: name,
            certification: certification,
            verified: false,
            verification-date: u0
        })
        (ok true)
    )
)

;; Verify a quality manager
(define-public (verify-manager (manager principal))
    (let ((manager-data (unwrap! (map-get? quality-managers manager) ERR-MANAGER-NOT-FOUND)))
        (asserts! (is-eq tx-sender (var-get contract-owner)) ERR-NOT-AUTHORIZED)
        (asserts! (not (get verified manager-data)) ERR-ALREADY-VERIFIED)
        (map-set quality-managers manager (merge manager-data {
            verified: true,
            verification-date: block-height
        }))
        (map-set manager-permissions manager {
            can-schedule-inspections: true,
            can-track-defects: true,
            can-create-corrective-actions: true,
            can-manage-improvements: true
        })
        (ok true)
    )
)

;; Check if manager is verified
(define-read-only (is-manager-verified (manager principal))
    (match (map-get? quality-managers manager)
        manager-data (get verified manager-data)
        false
    )
)

;; Get manager details
(define-read-only (get-manager (manager principal))
    (map-get? quality-managers manager)
)

;; Get manager permissions
(define-read-only (get-manager-permissions (manager principal))
    (map-get? manager-permissions manager)
)

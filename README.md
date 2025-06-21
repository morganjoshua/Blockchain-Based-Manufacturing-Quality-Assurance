# Blockchain-Based Manufacturing Quality Assurance

A comprehensive blockchain-based quality assurance system for manufacturing processes built on the Stacks blockchain using Clarity smart contracts.

## Overview

This system provides a decentralized, transparent, and immutable platform for managing manufacturing quality assurance processes including:

- Quality manager verification and authorization
- Inspection scheduling and tracking
- Defect reporting and resolution
- Corrective action management
- Continuous improvement initiatives

## Smart Contracts

### 1. Quality Manager Contract (`quality-manager.clar`)
Manages the verification and authorization of quality managers who can interact with the system.

**Key Features:**
- Register new quality managers
- Verify manager credentials
- Manage permissions for different quality operations
- Track manager certification and verification dates

**Main Functions:**
- \`register-manager\`: Register a new quality manager
- \`verify-manager\`: Verify a quality manager's credentials
- \`is-manager-verified\`: Check if a manager is verified
- \`get-manager\`: Retrieve manager details

### 2. Inspection Scheduling Contract (`inspection-scheduling.clar`)
Handles the scheduling, tracking, and recording of quality inspections.

**Key Features:**
- Schedule quality inspections
- Track inspection status
- Record inspection results
- Manage inspector assignments

**Main Functions:**
- \`schedule-inspection\`: Schedule a new quality inspection
- \`update-inspection-status\`: Update the status of an inspection
- \`record-inspection-result\`: Record the results of a completed inspection
- \`get-inspection\`: Retrieve inspection details

### 3. Defect Tracking Contract (`defect-tracking.clar`)
Manages the reporting, tracking, and resolution of manufacturing defects.

**Key Features:**
- Report manufacturing defects
- Assign defects to quality managers
- Track defect resolution progress
- Maintain defect history

**Main Functions:**
- \`report-defect\`: Report a new manufacturing defect
- \`assign-defect\`: Assign a defect to a quality manager
- \`update-defect-status\`: Update defect status
- \`resolve-defect\`: Record defect resolution

### 4. Corrective Action Contract (`corrective-action.clar`)
Manages corrective actions taken to address quality issues.

**Key Features:**
- Create corrective actions for defects
- Track action progress and completion
- Manage action assignments and due dates
- Monitor corrective action effectiveness

**Main Functions:**
- \`create-corrective-action\`: Create a new corrective action
- \`update-action-progress\`: Update progress on an action
- \`update-action-status\`: Update action status
- \`get-corrective-action\`: Retrieve action details

### 5. Continuous Improvement Contract (`continuous-improvement.clar`)
Handles quality improvement initiatives and tracks their progress.

**Key Features:**
- Propose improvement initiatives
- Set and track improvement metrics
- Approve initiatives with budget allocation
- Monitor improvement progress

**Main Functions:**
- \`propose-initiative\`: Propose a new improvement initiative
- \`set-initiative-metrics\`: Set baseline and target metrics
- \`approve-initiative\`: Approve an initiative with budget
- \`update-initiative-metrics\`: Update current metrics

## System Architecture

The system follows a modular architecture where each contract handles a specific aspect of quality assurance:

1. **Quality Manager Contract** - Central authorization system
2. **Inspection Scheduling** - Proactive quality control
3. **Defect Tracking** - Reactive quality management
4. **Corrective Action** - Problem resolution
5. **Continuous Improvement** - Long-term quality enhancement

## Authorization Model

The system uses a role-based authorization model:

- **Contract Owner**: Can register and verify quality managers
- **Verified Quality Managers**: Can perform all quality operations
- **Inspectors**: Can update inspection status and record results
- **Assigned Personnel**: Can update progress on assigned tasks

## Data Flow

1. Quality managers are registered and verified by the contract owner
2. Verified managers can schedule inspections and report defects
3. Defects trigger corrective actions assigned to qualified personnel
4. Improvement initiatives are proposed, approved, and tracked
5. All activities are recorded immutably on the blockchain

## Testing

The system includes comprehensive test suites for all contracts using Vitest:

- Unit tests for all contract functions
- Error condition testing
- Authorization testing
- Data integrity verification

Run tests with:
\`\`\`bash
npm test
\`\`\`

## Deployment

Deploy contracts to Stacks blockchain:

1. Configure your Stacks wallet and network
2. Deploy contracts in the following order:
    - quality-manager.clar
    - inspection-scheduling.clar
    - defect-tracking.clar
    - corrective-action.clar
    - continuous-improvement.clar

## Usage Examples

### Register and Verify a Quality Manager
\`\`\`clarity
;; Register manager
(contract-call? .quality-manager register-manager 'ST2CY5V39NHDPWSXMW9QDT3HC3GD6Q6XX4CFRK9AG "John Doe" "ISO 9001 Certified")

;; Verify manager
(contract-call? .quality-manager verify-manager 'ST2CY5V39NHDPWSXMW9QDT3HC3GD6Q6XX4CFRK9AG)
\`\`\`

### Schedule an Inspection
\`\`\`clarity
(contract-call? .inspection-scheduling schedule-inspection "PROD-001" 'ST2CY5V39NHDPWSXMW9QDT3HC3GD6Q6XX4CFRK9AG u1000 "quality-check")
\`\`\`

### Report a Defect
\`\`\`clarity
(contract-call? .defect-tracking report-defect "PROD-001" "surface-defect" "high" "Visible scratches on product surface")
\`\`\`

## Security Considerations

- All sensitive operations require verified quality manager authorization
- Contract owner privileges are limited to manager registration/verification
- Immutable audit trail for all quality activities
- Role-based access control prevents unauthorized modifications

## Future Enhancements

- Integration with IoT sensors for automated defect detection
- Machine learning integration for predictive quality analytics
- Multi-signature approvals for high-value initiatives
- Integration with supply chain tracking systems
- Real-time quality dashboards and reporting

## License

This project is licensed under the MIT License.

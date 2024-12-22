# Care Benefit Verification API

## Overview
This MuleSoft application provides a RESTful API endpoint for creating Care Benefit Verification records in Salesforce Health Cloud. The API is built using Mule 4 and implements secure integration patterns for healthcare data processing.

## Technical Stack
- Mule Runtime: 4.4.0
- Anypoint Studio: 7.x
- API Specification: RAML 1.0
- Salesforce Connector: Salesforce Health Cloud
- Security: Basic Auth, OAuth Username and Password ,OAuth 2.0
- Logging: Custom logging framework with correlation IDs

## Features
- RESTful API endpoint for Care Benefit Verification requests
- Salesforce Health Cloud integration
- Error handling and validation
- Request/Response logging
- Monitoring and metrics
- Data transformation
- Security implementation

## Prerequisites
1. Anypoint Studio 7.x with Mule 4.4.0 runtime
2. Salesforce Health Cloud sandbox/production credentials
3. Anypoint Platform account
4. Maven 3.x

## Configuration
### Property Files
- `src/main/resources/config/common-propertiesv.yaml`
- `src/main/resources/config/config-dev.yaml`

### Environment Variables
```yaml
salesforce:
  system.username: "REPLACE"
  system.password: "REPLACE"
  system.token: "REPLACE"
  system.consumerKey: "REPLACE"
  system.consumerSecret: "REPLACE"

```

## API Specifications

### Endpoint
```
POST /api/v1/care-benefit-verifications
GET /api/v1/care-benefit-verifications
GET  /api/v1/ping
```

### Request Format
```json
{
    "patientDetails": {
        "firstName":"Amari",
        "lastName": "Rajan",
        "dateOfBirth": "1990-12-08",
        "gender": "Male"
    },
    "insuranceInformation": {
        "insuranceProviderName": "Assignment-Plan",
        "policyNumber": "BC123456789",
        "groupNumber": "1234567",
        "subscriberID": "001Kd00001nUlpXIAS"
    } ,
    "providerInformation": {
        "nationalProviderIdentifier": "1234",
        "providerName": "Assignment-Plan NPI"
    },
    "serviceDetails": {
        "serviceType": "consultation",
        "serviceDate": "2024-12-14",
        "diagnosisCode": "8151",
        "procedureCode": "90834"
    }
}
```

### Response Format
```json
[
    {
        "Successful": true,
        "RecordId": "0n2Kd000000ssUvIAI"
    }
]
```

## Installation & Deployment

1. Clone the repository:
```bash
git clone [repository-url]
```

2. Import project in Anypoint Studio:
- File > Import > Anypoint Studio > Anypoint Studio project from File System

3. Configure environment properties:
- Update property files with appropriate values
- Set up environment variables

4. Build the project:
```bash
mvn clean package
```

5. Deploy to CloudHub First way:
```bash
mvn deploy -DmuleDeploy
```
```bash
Upload the jar manually to runtime manager
```

## Error Handling
The application implements comprehensive error handling:
- Input validation errors
- Salesforce integration errors
- System errors
- Business rule violations

## Monitoring & Logging
- Custom logging framework implementation
- Integration with Anypoint Monitoring
- Correlation ID tracking
- Business event tracking


## Security
- Basic Auth implementation for API Connectivity
- Basic Auth for Salesforce Connectivity
- OAuth with User and Password for Salesforce Connectivity
- OAuthV2.0 for Salesforce Connectivity
- HTTPS Endpoint


## Testing
### Unit Tests
```bash
mvn clean test
```

### Munits Coverage Report
![image](https://github.com/user-attachments/assets/26a7eb6a-dbcb-4e29-b21a-c01998b34eb1)


## Run Locally

Configure these two vm arguments to run in your machine to avoid blocking your requests and munit execution

-DskipTests=true
-Danypoint.platform.gatekeeper=disabled

 # Newsletter and push notification server
 ##### API:
  __/api/newsletters__ - GET
  returns an object:
   ```
   {
      1: {
        'id': 1,
        'title': 'Housing',
        'complete': false
      },
      2: {
        'id': 2,
        'title': 'Sports',
        'complete': false
      },
      3: {
        'id': 3,
        'title': 'Locals',
        'complete': false
      }
  }
  ```
  
  __/api/notifications__ - POST
  send a push subscription object so later on can receive push notifications 
  (https://developer.mozilla.org/en-US/docs/Web/API/PushSubscription)
  
  __/api/newsletter__ -POST 
  triggers the server to send push notification to all the subscribers
  
##### Create vapid keys
`npm install web-push -g` and run `web-push generate-vapid-keys --json` from the result extract the `publicKey` and `privateKey`

#### Run locally with npm 
create environment variables `WEB_PUSH_PUBLIC_KEY` and `WEB_PUSH_PRIVATE_KEY` with results of previous step.
Now `npm i` and then`npm run build:start`

#####  Run from Docker
to pull run 
`docker pull germanvs/newsletter-server`
and run server with: 
`docker run -p 9000:9000  --env WEB_PUSH_PUBLIC_KEY={publicKey} --env WEB_PUSH_PRIVATE_KEY={privateKey} -d germanvs/newsletter-server`

##### Alternatively create your image 
 `docker build -t web-app .`
 run server:
 `docker run -p 9000:9000  --env WEB_PUSH_PUBLIC_KEY={publicKey} --env WEB_PUSH_PRIVATE_KEY={privateKey} -d web-app` 

visit `http://localhost:9000/api/newsletters`

#### client apps
For a client app to become a subscriber of the server so it receives push notifications it needs to provide the previously created
__publicKey__ to the PUSH API - PushManager.subscribe() method as described in: https://developer.mozilla.org/en-US/docs/Web/API/PushManager/subscribe


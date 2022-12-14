GOOGLE_PROJECT_ID=johnny-b-sandbox # YOUR GCP PROJECT ID GOES HERE

# The service currently reads from the "Ingredients" tab in the Google Sheet
# https://docs.google.com/spreadsheets/d/1rcj3SbeK_VcMOBrwwdAksJXQVoHTZHRzVOBO8A3X148/edit#gid=0
# Feel free to make a copy of that sheet and adapt it and the code to your needs.
# SHEET_ID=1rcj3SbeK_VcMOBrwwdAksJXQVoHTZHRzVOBO8A3X148
SHEET_ID=1d_-5gkzduy4Opv6m_KWIHJaMIUmyT1d6odExVuD_SSk
TAB_ID=Ingredients

gcloud builds submit --tag gcr.io/$GOOGLE_PROJECT_ID/rest-api-sheet \
  --project=$GOOGLE_PROJECT_ID

gcloud beta run deploy rest-api-sheet \
  --image gcr.io/$GOOGLE_PROJECT_ID/rest-api-sheet \
  --platform managed \
  --region us-central1 \
  --set-env-vars SHEET_ID=$SHEET_ID,TAB_ID=$TAB_ID \
  --project=$GOOGLE_PROJECT_ID

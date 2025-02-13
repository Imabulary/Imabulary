type Field = { label: string; value: string };

export const generateFeedbackHtml = (fields: Field[]) => `
    <html>
      <body>
        ${fields
          .map(
            ({ label, value }) => `
        <b>${label}: </b>
        <span>{{params.${value}}}</span>
        <br>`,
          )
          .join('')}
      </body>
    </html>
  `;

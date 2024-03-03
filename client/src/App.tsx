import { CloudUpload } from '@mui/icons-material';
import { Box, Button, Card, CardContent, CardMedia, Stack, Typography, styled } from '@mui/material';
import { fileAPI } from './redux/api';
import { useEffect } from 'react';
import { yellow } from '@mui/material/colors';

const VisuallyHiddenInput = styled('input')({
  clip: 'rect(0 0 0 0)',
  clipPath: 'inset(50%)',
  height: 1,
  overflow: 'hidden',
  position: 'absolute',
  bottom: 0,
  left: 0,
  whiteSpace: 'nowrap',
  width: 1,
});

function App() {
  const [upload, { error, isLoading, data }] = fileAPI.useUploadMutation();

  const handleFileUpload = async (event: React.ChangeEvent<HTMLInputElement>) => {
    const file = event.target?.files?.[0];

    if (!file) {
      // TODO: display error saying that something went wrong during file uploading
      return;
    }

    const fileSize = file?.size ?? 0;
    const fileSizeMB = fileSize / (1024 * 1024);
    const fileSizeMBNumber = +fileSizeMB.toFixed(2);

    if (fileSizeMBNumber > 5) {
      // TODO: Display an error message saying that file size is greater than 5 MB
      return;
    }

    await upload({ file });
  };

  useEffect(() => console.log(error), [error]);

  return (
    <Stack gap={2} width={345}>
      <Button component="label" variant="contained" startIcon={<CloudUpload />} disabled={isLoading}>
        Upload file
        <VisuallyHiddenInput type="file" accept="image/*" onChange={handleFileUpload} />
      </Button>
      {data?.result && (
        <Card sx={{ maxWidth: 345 }}>
          <CardMedia sx={{ height: 250 }} image={data.result.image_url} title={data.result.word} />
          <CardContent>
            <Typography variant="h5" component="div">
              {data.result.translated_word}
            </Typography>
            <Typography gutterBottom color="text.secondary" variant="body2">
              {data.result.word}
            </Typography>
            <Typography gutterBottom variant="body2" color={yellow[600]}>
              Related Phrases
            </Typography>
            <Stack gap={1}>
              <Box>
                <Typography variant="body2">{data.result.phrase}</Typography>
                <Typography variant="caption" color="text.secondary">
                  English
                </Typography>
              </Box>
              <Box>
                <Typography variant="body2">{data.result.translated_phrase}</Typography>
                <Typography variant="caption" color="text.secondary">
                  Ukrainian
                </Typography>
              </Box>
            </Stack>
          </CardContent>
        </Card>
      )}
    </Stack>
  );
}

export default App;

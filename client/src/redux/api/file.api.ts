import { createApi, fetchBaseQuery } from '@reduxjs/toolkit/query/react';

export const fileAPI = createApi({
  reducerPath: 'file',
  baseQuery: fetchBaseQuery({ baseUrl: import.meta.env.VITE_API_URL }),
  tagTypes: ['File'],
  endpoints: (builder) => ({
    upload: builder.mutation<{ result: string }, { file: File }>({
      queryFn: async (body, _queryApi, _extraOptions, fetchWithBQ) => {
        const formData = new FormData();
        formData.append('file', body.file);

        const response = await fetchWithBQ({
          url: 'upload',
          method: 'POST',
          body: formData,
        });

        if (response.error) throw response.error;

        return response as { data: { result: string } };
      },
      invalidatesTags: () => ['File'],
    }),
  }),
});

import { createApi, fetchBaseQuery } from '@reduxjs/toolkit/query/react';
import { Card } from '../../shared/types';

export const fileAPI = createApi({
  reducerPath: 'file',
  baseQuery: fetchBaseQuery({ baseUrl: import.meta.env.VITE_API_URL }),
  tagTypes: ['File'],
  endpoints: (builder) => ({
    upload: builder.mutation<{ result: Card }, { file: File }>({
      queryFn: async (body, _queryApi, _extraOptions, fetch) => {
        const formData = new FormData();
        formData.append('file', body.file);

        const response = await fetch({
          url: 'upload',
          method: 'POST',
          body: formData,
        });

        if (response.error) throw response.error;

        return response as { data: { result: Card } };
      },
      invalidatesTags: () => ['File'],
    }),
  }),
});

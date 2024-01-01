import { configureStore } from '@reduxjs/toolkit';
import { TypedUseSelectorHook, useDispatch, useSelector } from 'react-redux';
import { fileAPI } from './api';

export const store = configureStore({
  reducer: {
    [fileAPI.reducerPath]: fileAPI.reducer,
  },
  middleware: (getDefaultMiddleware) => getDefaultMiddleware().concat([fileAPI.middleware]),
  devTools: import.meta.env.NODE_ENV === 'development',
});

export type RootState = ReturnType<typeof store.getState>;
export type AppDispatch = typeof store.dispatch;

export const useAppDispatch: () => AppDispatch = useDispatch;
export const useAppSelector: TypedUseSelectorHook<RootState> = useSelector;
